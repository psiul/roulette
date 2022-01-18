select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,item i,customer_address a
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 472 and cs.cs_hash <= 872 and i.i_hash >= 402 and i.i_hash <= 735 and a.ca_hash >= 174 and a.ca_hash <= 924
;
