# Shiva

Shiva is a simple-but-powerful powershell script that uses CSV files to store and retrieve schedules containing a theoretically unlimited number of regularly recurring events.

## What is the point of this? Why not just use Outlook/Apple Calendar/Google Calendar?

Most graphical calendar systems I have seen do not seem to work well for managing organizational routines with hundreds or thousands of recurring events. This is especially true as small changes take place over time and/or multiple people are responsible for making adjustments. Text-based scheduling systems are better suited to delivering just-in-time information, fine-scale control and versioning. 

## Doesn't anything like this already exist?

Some solutions such as the 31-year-old program [remind](https://linux.die.net/man/1/remind) are feature-rich but also have a high learning curve. Shiva is designed around step-by-step processes that make it easy to add, remove and edit events. Being written in Microsoft's open source Powershell scripting language, it can be used on any type of system without the need for administrative privileges. If need be, schedules can also be updated manually using any spreadsheet editing software.

## What kind of organization still uses daily, synchronous schedules to direct its routine?

More than you would imagine. 

## Usage

Documentation coming soon.

## Desired Features

- List all events by P-code
- Cycle through days, toggle u/w or ip with keyboard shortcuts.
- Color fonts and backgrounds
- Keyboard shortcut to edit event file, exit
- Remove u/w punchtape
- help screen for shortcuts
- Color code overlapping events
- Support for one-time events
- event file format validator, duplicate finder
- Deconfliction logic for one-time events
- Deconfliction logic for locations (no events can occur same time same place)
- Event input assistant

## How it works

Like any database-driven content management system, Shiva queries a set of tables to determine whether events apply to particular days. For exmaple, say that a ship is underway on Saturday, May 2 2020. Shiva populates all events for a Saturday, minus anything that is in-port only. Next, Shiva will add all events set
to occur daily, as well as events set to occur every day other than Sunday. Finally, Shiva will check a table of one-time events and if anything is listed for 02MAY2020, the program will add those events in to the final output as well.



