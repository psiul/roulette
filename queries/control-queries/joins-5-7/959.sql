select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 490 and ss.ss_hash <= 890 and c.c_hash >= 222 and c.c_hash <= 555 and a.ca_hash >= 71 and a.ca_hash <= 821
;
