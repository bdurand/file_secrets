# FileSecrets

This gem provides a simple method to support the pattern of reading sensitive information that is stored in files that is deployed separately from the code that needs them.

The basic pattern is to deploy your sensitive information into a directory structure like:

```
/srv
|-- /secrets
    |--/api
       |-- secret_key
       |-- token
```

You could then read your secrets with `FileSecrets`:

```
  secrets = FileSecrets.new("/srv/secrets")
  secrets["api/secret_key"]
  secrets["api/token"]
```

If the file doesn't exist, `nil` will be returned.

Each `FileSecrets` object will have a base directory where it will locate the files from. If this is not provided in the initializer, it will be set from the FILE_SECRETS_BASE environment variable. If that isn't set, then it will be set to the current working directory.

There is also a handy class level accessor that you can use either if you want to use the default base path:

```
  ENV["FILE_SECRETS_BASE"] = "/srv/secrets"
  FileSecrets["api/secret_key"]
  FileSecrets["api/token"]
```

The paths passed to get the file values are virtual paths using the `/` character as a file separator. So, you would pass the same keys on Windows that you would on Linux.
