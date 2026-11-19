# Prolog Language Demonstration

This project demonstrates the Prolog programming language

- **Backtracking Search:** Uses facts, rules, recursion, and backtracking to find possible routes between cities.
- **Expression Analyzer:** Uses pattern matching and rules to identify data types and check whether operations are valid.

## Requirements

- SWI-Prolog
- Visual Studio Code (recommended)
- Prolog extension for VS Code (optional)

## Installing SWI-Prolog

### Windows

1. Visit https://www.swi-prolog.org/download/stable
2. Download the Windows 64-bit installer.
3. Run the installer and follow the installation instructions.
4. Add SWI-Prolog to your system PATH to use it in the terminal.
5. Open PowerShell or Command Prompt.
6. Verify the installation:

```bash
swipl --version
```

### macOS

1. Visit https://www.swi-prolog.org/download/stable
2. Download the macOS installer.
3. Open the downloaded file and follow the installation instructions.
4. Open Terminal and verify the installation:

```bash
swipl --version
```

If the command is not recognized, make sure SWI-Prolog's executable directory is in your PATH.

### Linux

1. Open the terminal.
2. Update the package list:

```bash
sudo apt update
```

3. Install SWI-Prolog:

```bash
sudo apt install swi-prolog
```

4. Verify the installation:

```bash
swipl --version
```

## Setting Up Visual Studio Code

1. Open Visual Studio Code.
2. Open Extensions (`Ctrl + Shift + X`).
3. Search for Prolog and install a Prolog extension.
4. Open the folder containing the project files.
5. Open the terminal using **Terminal → New Terminal**.

## Running the Programs

### Backtracking Search

This program finds all possible routes from city A to city D.

Open the terminal in the project folder and run:

```bash
swipl backtracking.pl
```

The program automatically runs and displays the routes found.

### Expression Analyzer

This program identifies data types and checks whether expressions are valid.

Open the terminal in the project folder and start Prolog:

```bash
swipl
```

Load the program:

```prolog
['expression_analyzer.pl'].
```

Run the demonstration:

```prolog
demo.
```

The program displays whether each expression is valid and identifies the result type when a match is found.

## Exiting Prolog

To exit the Prolog interpreter, type:

```prolog
halt.
```

## Conclusion

These programs demonstrate how Prolog uses facts, rules, recursion, backtracking, and pattern matching to solve problems.