select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,customer_address a,date_dim d,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 230 and hd.hd_hash <= 563 and d.d_hash >= 81 and d.d_hash <= 831 and i.i_hash >= 239 and i.i_hash <= 639
;
