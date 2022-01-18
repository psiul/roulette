select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,customer_address a,customer_demographics cd,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 368 and ss.ss_hash <= 701 and c.c_hash >= 3 and c.c_hash <= 753 and d.d_hash >= 210 and d.d_hash <= 610
;