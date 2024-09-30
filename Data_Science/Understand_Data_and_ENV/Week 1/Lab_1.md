```mermaid
flowchart TD
    A[Access to GP] -->C{Have you registered to a GP}
    C -->|Yes| D[Continue]
        D -->F[Age] -->G[Gender]
            F -->0-11/12-16/
            F 
        
    C -->|No| E[Back to the start] -->A
```