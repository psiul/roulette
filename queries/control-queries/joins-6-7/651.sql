select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,customer_address a,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 19 and ss.ss_hash <= 769 and cd.cd_hash >= 220 and cd.cd_hash <= 620 and a.ca_hash >= 579 and a.ca_hash <= 912
;
