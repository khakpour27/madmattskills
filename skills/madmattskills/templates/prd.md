# PRD: <Feature name>

Status: open

## Problem Statement

<The problem from the user's perspective, in their words. Why now.>

## Solution

<The solution from the user's perspective. One or two paragraphs.>

## User Stories

1. As a <actor>, I want <capability>, so that <benefit>.
2. ...

<Be exhaustive. Each story must be testable. Use Given/When/Then for any story
with non-obvious rules.>

## Implementation Decisions

### Modules

| Module | New / Modified | Responsibility | Deep? |
|---|---|---|---|
| `<path/to/module>` | New | <what it owns> | Yes — tested at interface |

### Interfaces

```
<proposed public interface of each new deep module: function signatures, types>
```

### Data model

<Schema changes, migrations, backfills of existing data.>

### Other decisions

- <Decision> — <why>

## Testing Decisions

- What makes a good test here: behaviour through the public interface, not
  implementation details.
- Modules to test: <deep modules>. Test boundary: <where>.
- Test infrastructure / prior art to reuse: <existing helpers, test DB>.
- Not tested automatically (human QA): <e.g. visual UI>.

## Out of Scope

- <Thing we decided not to do> — <why>

## Further Notes

<Open questions, follow-ups, links to the brief or transcript.>
