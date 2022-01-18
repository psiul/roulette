select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,customer c,customer_address a,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 31 and ss.ss_hash <= 781 and i.i_hash >= 240 and i.i_hash <= 573 and cd.cd_hash >= 364 and cd.cd_hash <= 764
;
