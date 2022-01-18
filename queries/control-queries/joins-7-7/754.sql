select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,date_dim d,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 37 and ss.ss_hash <= 787 and hd.hd_hash >= 245 and hd.hd_hash <= 645 and c.c_hash >= 372 and c.c_hash <= 705
;
