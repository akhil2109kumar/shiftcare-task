# ShiftCare Ruby CLI

A simple Ruby command-line tool to search clients by name and detect duplicate emails from a JSON dataset.

## Prerequisites

- Ruby 3.2.2
- Bundler (`gem install bundler`)

## Setup
1. **Clone the repository**:

   ```bash
   git clone https://github.com/your-username/shiftcare-task.git
   
   cd shiftcare-task
   ```

2. **Install dependencies**:

   ```bash
   bundle install
   ```

## Usage Instructions

### 1. Search clients by name:

    ```bash
    ruby bin/shiftcare.rb -s john
    ```

### 2. Find duplicate emails:

    ```bash
    ruby bin/shiftcare.rb -d
    ```

## Running tests
Run the test suite using:

```bash
bundle exec rspec
```

## Assumptions and Decisions Made
- It is assumed that the input file (clients.json) is well-structured and contains valid JSON.

- Each client is represented by a hash with at least full_name and email keys.

- The tool is built as a CLI for simplicity and quick execution.

## Known Limitations and Areas for Future Improvement
- Currently only supports name-based search; field to search is hardcoded.

- No JSON schema validation — if the file structure changes, it may cause failures.

- Outputs are plain text; no support for exporting results.

- No logging or detailed error messages for invalid input.

- The command-line flags are limited; support for multiple options or filters could be added.


## Future Enhancements
If more time were available, here’s what could be prioritized:

- Dynamic Search: Allow users to specify the field to search (e.g., --field email -s "example@example.com").

- REST API Integration: Provide the same search and duplicate detection functionality via endpoints (e.g., GET /query?q=john).

- Performance Optimization: Improve scalability for large datasets, possibly with indexing or streaming JSON.

- JSON Schema Validation: Validate the structure of the input file before processing.

- Output Formats: Add support for outputting search results in JSON or CSV.

