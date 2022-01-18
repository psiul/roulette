select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,date_dim d,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 167 and c.c_hash <= 500 and i.i_hash >= 467 and i.i_hash <= 867 and hd.hd_hash >= 218 and hd.hd_hash <= 968
;
