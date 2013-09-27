## Taken from

http://docs.aws.amazon.com/AWSECommerceService/latest/DG/EX_LookupbyISBN.html


## Example Request
http://webservices.amazon.com/onca/xml?
  Service=AWSECommerceService
  &Operation=ItemLookup
  &ResponseGroup=Large
  &SearchIndex=All
  &IdType=ISBN
  &ItemId=076243631X
  &AWSAccessKeyId=[Your_AWSAccessKeyID]
  &AssociateTag=[Your_AssociateTag]
  &Timestamp=[YYYY-MM-DDThh:mm:ssZ]
  &Signature=[Request_Signature]

## Example Response

<Item>
  <ASIN>076243631X</ASIN>
  <DetailPageURL>
    http://www.amazon.com/Mammoth-Book-Tattoos-Lal-Hardy/dp/076243631X%3FAWSAccessKeyId%3D[Your_AWSAccessKeyId]%26tag%3D[Your_AssociateTag]%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3D076243631X
  </DetailPageURL>
  <SalesRank>7483</SalesRank>
  <ItemAttributes>
    <Author>Lal Hardy</Author>
    <Binding>Paperback</Binding>
    <DeweyDecimalNumber>391.65</DeweyDecimalNumber>
    <EAN>9780762436316</EAN>
    <Feature>ISBN13: 9780762436316</Feature>
    <Feature>Condition: New</Feature>
    <ISBN>076243631X</ISBN>
    <Manufacturer>Running Press</Manufacturer>
    <NumberOfItems>1</NumberOfItems>
    <NumberOfPages>512</NumberOfPages>
    <ProductGroup>Book</ProductGroup>
    <PublicationDate>2009-03-10</PublicationDate>
    <Publisher>Running Press</Publisher>
    <Studio>Running Press</Studio>
    <Title>The Mammoth Book of Tattoos</Title>
  </ItemAttributes>
</Item>
