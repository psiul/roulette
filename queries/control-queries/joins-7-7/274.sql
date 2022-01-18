select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 83 and i.i_hash <= 833 and a.ca_hash >= 112 and a.ca_hash <= 512 and d.d_hash >= 438 and d.d_hash <= 771
;
