#!/usr/bin/env python3
"""
Python script to apply an XSLT transformation to an XML file and generate an HTML output.
This script is fully operational and ready for use.

Steps performed by this script:
1. Load the source XML file (Real Estate Plateform Data.xml).
2. Load the XSLT stylesheet (xsl_Reviews_5th scenario.xslt).
3. Apply the XSLT transformation by passing parameters (targetType and targetId).
4. Save the resulting output to an HTML file named 'reviews_output.html'.
"""

import lxml.etree as ET

def main():
    # Define the file paths for the XML source and the XSLT stylesheet.
    xml_file = 'C:/Users/USER/OneDrive/Documents/Office Professionnel Personnalisé/DSTI/[A24] Data PipeLine - Part 1'
    xslt_file = 'C:/Users/USER/OneDrive/Documents/Office Professionnel Personnalisé/DSTI/[A24] Data PipeLine - Part 1'
    
    # Load the XML source document.
    try:
        xml_doc = ET.parse(xml_file)
    except Exception as e:
        print(f"Error loading XML file '{xml_file}': {e}")
        return
    
    # Load the XSLT stylesheet.
    try:
        xslt_doc = ET.parse(xslt_file)
    except Exception as e:
        print(f"Error loading XSLT file '{xslt_file}': {e}")
        return
    
    # Create the XSLT transformation object.
    transform = ET.XSLT(xslt_doc)
    
    # Define the parameters to be passed to the XSLT transformation.
    # For this example, we filter reviews for a property (targetType="Property") with the identifier "101".
    target_type_param = ET.XSLT.strparam('Property')
    target_id_param = ET.XSLT.strparam('101')
    
    # Apply the XSLT transformation and pass the defined parameters.
    try:
        result = transform(xml_doc, targetType=target_type_param, targetId=target_id_param)
    except Exception as e:
        print(f"Error during the transformation: {e}")
        return
    
    # Save the transformation result to an HTML file.
    output_file = 'reviews_output.html'
    try:
        with open(output_file, 'wb') as f:
            f.write(ET.tostring(result, pretty_print=True, encoding='UTF-8'))
        print(f"Transformation completed. The file '{output_file}' has been created.")
    except Exception as e:
        print(f"Error writing the output file '{output_file}': {e}")

if __name__ == "__main__":
    main()