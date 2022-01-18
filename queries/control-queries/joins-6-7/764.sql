select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,date_dim d,customer_address a,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 514 and cd.cd_hash <= 847 and c.c_hash >= 48 and c.c_hash <= 798 and i.i_hash >= 173 and i.i_hash <= 573
;
