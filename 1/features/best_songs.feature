Feature: Find songs most listened to

  Scenario:
    Given an "sample_input.txt" file containing:
    """
    4 2
    30 one
    30 two
    15 three
    25 four
    """
    When I run the search using the "sample_input.txt" file
    Then the output should be:
    """
    four
    two
    """
