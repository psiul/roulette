select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 452 and ss.ss_hash <= 785 and a.ca_hash >= 457 and a.ca_hash <= 857 and cd.cd_hash >= 55 and cd.cd_hash <= 805
;
