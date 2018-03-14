Long `quote` blocks are generally an indication that too much is done inside
them.

Let's look at why this is problematic:

    defmodule MetaCommand do
      def __using__(opts \\ []) do
        modes = opts[:modes]
        command_name = opts[:command_name]

        quote do
          def run(filename) do
            contents =
              if File.exists?(filename) do
                {:ok, file} = File.open(filename, unquote(modes))
                {:ok, contents} = IO.read(file, :line)
                File.close(file)
                contents
              else
                ""
              end

            case contents do
              "" ->
                # ...
              unquote(command_name) <> rest ->
                # ...
            end
          end

          # ...
        end
      end
    end

A cleaner solution would be to call "regular" functions outside the
`quote` block to perform the actual work.

    defmodule MyMetaCommand do
      def __using__(opts \\ []) do
        modes = opts[:modes]
        command_name = opts[:command_name]

        quote do
          def run(filename) do
            MyMetaCommand.run_on_file(filename, unquote(modes), unquote(command_name))
          end

          # ...
        end
      end

      def run_on_file(filename, modes, command_name) do
        contents =
          # actual implementation
      end
    end

This way it is easier to reason about what is actually happening. And to debug
it.
