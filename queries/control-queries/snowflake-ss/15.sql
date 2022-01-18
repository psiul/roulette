select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 308 and ss.ss_hash <= 641 and cd.cd_hash >= 190 and cd.cd_hash <= 590 and a.ca_hash >= 91 and a.ca_hash <= 841
;
