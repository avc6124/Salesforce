// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents
Integer phoneFieldUsage = 0;

// Build a SOQL query to count non-null values for the Phone field
String query = 'SELECT COUNT(Id) FROM Contact WHERE Phone != null';

// Execute the query
try {
    // Use Database.query() to execute the SOQL query
    List<AggregateResult> results = Database.query(query);

    // Retrieve the count from the aggregate result
    if (!results.isEmpty()) {
        Object countResult = results[0].get('expr0');
        if (countResult != null && countResult instanceof Decimal) {
            phoneFieldUsage = ((Decimal)countResult).intValue();
        }
    }
} catch (Exception e) {
    // Handle any exceptions here
    System.debug('Error querying Phone field: ' + e.getMessage());
}

// Display the usage count for the Phone field
System.debug('Usage Count for Phone field: ' + phoneFieldUsage);