/*
 * #%L
 * adaptTo()
 * %%
 * Copyright (C) 2014 adaptTo() Conference
 * %%
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * #L%
 */
package org.adaptto.demo.rookie.services;

import java.util.Iterator;

import javax.jcr.query.Query;

import org.apache.commons.lang.StringUtils;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.resource.LoginException;
import org.apache.sling.api.resource.PersistenceException;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.resource.ResourceResolverFactory;
import org.apache.sling.api.resource.ValueMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Background job to automatically remove empty comments.
 */
@Component(immediate = true, metatype = true, label = "adaptTo() Rookie Demo Comment Cleanup Service",
    description = "Removes all empty comments.")
@Service(value = Runnable.class)
public class CommentCleanUp implements Runnable {

  @Property(value = "0 0/15 * * * ?", // run every 15 minutes
  label = "Scheduler Expression",
      description = "Cron expression for scheduling, see http://www.quartz-scheduler.org/docs/tutorials/crontrigger.html for examples.")
  private static final String PROPERTY_CRON_EXPRESSION = "scheduler.expression";

  @Reference
  ResourceResolverFactory resourceResolverFactory;

  private final Logger log = LoggerFactory.getLogger(getClass());

  @Override
  public void run() {
    ResourceResolver adminResolver = null;
    try {

      // get administrative resolver
      adminResolver = resourceResolverFactory.getAdministrativeResourceResolver(null);

      // fire query to get all comment nodes
      log.debug("Query for all comments.");
      Iterator<Resource> comments = adminResolver.findResources("SELECT * "
          + "FROM [sling:OrderedFolder] "
          + "WHERE ISDESCENDANTNODE([/content/adaptto]) "
          + "AND [sling:resourceType]='/apps/rookiedemo/components/social/comment'", Query.JCR_SQL2);

      // iterate over all comments and remove those that have empty text
      while (comments.hasNext()) {
        Resource comment = comments.next();
        log.debug("Check comment {}", comment.getPath());

        ValueMap props = comment.getValueMap();
        if (StringUtils.isEmpty(props.get("text", String.class))) {
          log.info("Delete empty comment {}", comment.getPath());
          adminResolver.delete(comment);
        }
      }

      // save changes to repository
      if (adminResolver.hasChanges()) {
        adminResolver.commit();
      }

    }
    catch (LoginException ex) {
      log.error("Error getting administrativ resolver.", ex);
    }
    catch (PersistenceException ex) {
      log.error("Error persisting changes to repository.", ex);
    }
    finally {
      if (adminResolver!=null) {
        adminResolver.close();
      }
    }
  }

}
