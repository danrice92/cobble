# Novum Opus Web Development Process

## Important Notes:
- Unless the Project Owner explicitly says otherwise, all stories should be based off of the `development` branch.
- `development` auto-deploys to staging; `master` auto-deploys to production, [www.novumopus.com](http://www.novumopus.com).

## Feature Development
All stories are found in [Pivotal Tracker](https://www.pivotaltracker.com/n/projects/2192010). Ask the Project Owner for permission to access Pivotal if you don't have it already.
1. Pick a story and start it in Pivotal.
2. Create a local branch in your development environment to work on the story:
        $ git checkout development
        $ git pull
        $ git checkout -b job-experiences-#143516809
3. Create a feature test for your feature.
4. Implement your feature and satisfy the test you created.
5. Repeat 3 and 4 as needed, WIP committing any work that is not completed at the end of the day.
6. Do any styling and layout tweaks needed.
7. Run the entire test suite. Fix any tests your changes broke.
8. Commit your branch to GitHub:
        $ git add .      # make sure you only add what should be added
                         # add things to .gitignore if needed
        $ git diff       # sanity check changes, or use a Git GUI
        $ git commit -am '[#143516809] admin can sign in'
        $ git push
9. Create a pull request using the [PULL_REQUEST_TEMPLATE.md](PULL_REQUEST_TEMPLATE.md). Double check that you are merging into the `development` branch.
10. Ask someone to review your code.
11. Make any necessary changes, address PR review comments, and discuss any ignored comments.
12. Repeat 10 and 11 as needed.
13. Once at least one developer has reviewed the code, at least one developer has manually tested the changes, and you have no further changes to make to it, merge and delete your branch. This will automatically deploy your feature to the [Heroku staging app](https://novum-opus-web-staging.herokuapp.com/).

## Feature Delivery and Deployment

1. Mark your story as "finished" on Pivotal Tracker.
2. The Developer Lead will manually test the new story's functionality on staging and mark it as "delivered" unless there are any uncaught issues with the feature.
3. The Project Owner will review the story and decide to "accept" or "reject" the story.
4. If the Developer Lead or the Project Owner finds an issue with the story, address the concerns and make any necessary changes in a new branch, using the branch number as before. Follow the same process listed above to deliver the changes.
5. At the end of the sprint, or when release flags are reached (as decided by the Project Owner), the Project Owner will merge the `development` branch into `master`, which automatically deploys to [production](http://www.novumopus.com).
