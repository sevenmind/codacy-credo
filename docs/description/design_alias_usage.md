Functions from other modules should be used via an alias if the module's
namespace is not top-level.

While this is completely fine:

    defmodule MyApp.Web.Search do
      def twitter_mentions do
        MyApp.External.TwitterAPI.search(...)
      end
    end

... you might want to refactor it to look like this:

    defmodule MyApp.Web.Search do
      alias MyApp.External.TwitterAPI

      def twitter_mentions do
        TwitterAPI.search(...)
      end
    end

The thinking behind this is that you can see the dependencies of your module
at a glance. So if you are attempting to build a medium to large project,
this can help you to get your boundaries/layers/contracts right.

As always: This is just a suggestion. Check the configuration options for
tweaking or disabling this check.
