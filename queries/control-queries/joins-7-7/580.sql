select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 22 and i.i_hash <= 422 and c.c_hash >= 240 and c.c_hash <= 573 and d.d_hash >= 46 and d.d_hash <= 796
;
