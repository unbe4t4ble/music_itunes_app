<div style="text-align: center">
    <table>
        <tr>
             <td style="text-align: center">
                 <img src="/screenshoot/1.png" width="200"/>
             </td>
             <td style="text-align: center">
                 <img src="/screenshoot/2.png" width="200"/>
             </td>
             <td style="text-align: center">
                 <img src="/screenshoot/3.png" width="200"/>
             </td>
        </tr>  
    </table>
</div>

# Music iTunes App

## About

it is app for playing music from iTunes API.

## How to use ?

<div style="text-align: center">
    <table>
        <tr>
             <td style="text-align: center">
                 <img src="/screenshoot/use1.png" width="200"/>
             </td>
             <td style="text-align: center">
                 <img src="/screenshoot/use2.png" width="200"/>
             </td>
             <td style="text-align: center">
                 <img src="/screenshoot/use3.png" width="200"/>
             </td>
        </tr>  
    </table>
</div>


## Directory Structure

    .
    ├── core                       # For all common and core files.
    │   ├── data                   # common data
    │   ├── error                  # contains all Exceptions and Failures classes
    │   ├── usecases               # common presentation files
    │   └── util                   # common usecases
    |
    ├── feature                    # all features
        ├── music                  # music
            ├── data               # Data files of music
            ├   └── datasources    # DataSources Abstract Files and Implementations
            ├   └── models         # Models for data
            ├   └── repositories   # Repositories Implementation Classes
            └── domain             # Domain
            ├   └── entities       # Entities For music
            ├   └── usecases       # Usecases of music
            ├   └── repositories   # Repositories Abstract Classes
            ├── presentation       # music presentation files
            │   └── blocs          # music blocs
            │   └── pages          # music pages

## Architecture

This app uses Clean Architecture.
