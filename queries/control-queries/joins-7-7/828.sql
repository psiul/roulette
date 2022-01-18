select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_demographics cd,customer_address a,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 387 and ss.ss_hash <= 787 and d.d_hash >= 100 and d.d_hash <= 850 and hd.hd_hash >= 651 and hd.hd_hash <= 984
;
