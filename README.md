# Collaborative Real Estate Platform (XML Database Project)

## 📌 Project Overview

This project involves designing and utilizing an **XML database** for a collaborative real estate platform. The platform connects various entities such as properties, buyers, sellers, tenants, lessors, real estate agencies, agents, and service providers (e.g., home inspectors, maintenance services). It enables functionalities like property searches, booking visits, managing transactions, and scheduling services.

## 🏗️ Features & Objectives

- **XML Schema (XSD):** Defines the structure and constraints of the real estate data model.
- **XML Database:** Contains representative data conforming to the schema.
- **XSLT Transformations:**
  - Five stylesheets for data visualization based on different user scenarios.
  - One stylesheet converting XML data into another XML format.
  - One stylesheet converting XML data into JSON format.
- **Python Implementation:** Demonstrates the usage of an XML API for one scenario.
- **Comprehensive Report:** Explains modeling choices, scenario implementations, and AI assistance (if used).

## 📂 Repository Structure
```
📦 collaborative-real-estate-platform
├── 📜 report.pdf                 
├── 📂 xml                         
│   ├── database.xml             
│   ├── schema.xsd                
├── 📂 xslt                        
│   ├── scenario1.xsl             
│   ├── scenario2.xsl             
│   ├── scenario3.xsl            
│   ├── scenario4.xsl             
│   ├── scenario5.xsl            
│   ├── scenario6_conversion.xsl  
│   ├── scenario7_json.xsl       
├── 📂 outputs                     
│   ├── scenario1_output.xml
│   ├── scenario2_output.xml
│   ├── scenario3_output.xml
│   ├── scenario4_output.xml
│   ├── scenario5_output.xml
│   ├── scenario6_output.xml
│   ├── scenario7_output.json
├── 📂 code            
│   ├── main.py 
├── 📜 README.md                    
```

## 🚀 Getting Started
### Prerequisites
- XML/XSD Processing Tools (e.g., Oxygen XML Editor, Visual Studio Code with XML plugins)
- XSLT Processor (e.g., Saxon, Xalan)
- Python (with `lxml` or `xml.etree.ElementTree`) 

### Usage
1. **Validate the XML database** against the schema:
   ```sh
   xmllint --noout --schema xml/schema.xsd xml/database.xml
   ```
2. **Run XSLT transformations** (example using Saxon):
   ```sh
   java -jar saxon.jar -s:xml/database.xml -xsl:xslt/scenario1.xsl -o:outputs/scenario1_output.xml
   ```
3. **Run the Python script** for an implemented scenario:
   ```sh
   python code/main.py
   ```
   or
   ```sh
   javac code/Main.java && java -cp code Main
   ```

## 📑 Documentation
For more details, refer to the **report.pdf**, which explains the modeling approach, scenario descriptions, and implementation details.

## 🤝 Contributors
- **[]** - (Role & Contributions)
- **[]** - (Role & Contributions)
- **[]** - (Role & Contributions)

## 📜 License
This project is released under NO LICENSE. Feel free to use and modify it.
