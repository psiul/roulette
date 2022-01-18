select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer c,customer_demographics cd,household_demographics hd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 18 and i.i_hash <= 768 and d.d_hash >= 621 and d.d_hash <= 954 and hd.hd_hash >= 500 and hd.hd_hash <= 900
;
