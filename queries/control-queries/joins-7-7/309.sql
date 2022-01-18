select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,customer c,item i,household_demographics hd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 579 and c.c_hash <= 912 and i.i_hash >= 36 and i.i_hash <= 436 and hd.hd_hash >= 142 and hd.hd_hash <= 892
;
