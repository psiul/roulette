select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer_demographics cd,customer c,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and d.d_hash >= 170 and d.d_hash <= 920 and hd.hd_hash >= 653 and hd.hd_hash <= 986 and i.i_hash >= 449 and i.i_hash <= 849
;
