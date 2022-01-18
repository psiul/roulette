select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_address a,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 49 and hd.hd_hash <= 449 and c.c_hash >= 250 and c.c_hash <= 583 and d.d_hash >= 2 and d.d_hash <= 752
;
