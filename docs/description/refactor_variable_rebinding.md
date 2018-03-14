You might want to refrain from rebinding variables.

Although technically fine, rebinding to the same name can lead to less
precise naming.

Consider this example:

    def find_a_good_time do
      time = MyApp.DateTime.now
      time = MyApp.DateTime.later(time, 5, :days)
      {:ok, time} = verify_available_time(time)

      time
    end

While there is nothing wrong with this, many would consider the following
implementation to be easier to comprehend:

    def find_a_good_time do
      today = DateTime.now
      proposed_time = DateTime.later(today, 5, :days)
      {:ok, verified_time} = verify_available_time(proposed_time)

      verified_time
    end

