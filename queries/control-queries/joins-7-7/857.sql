select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,item i,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 650 and i.i_hash <= 983 and hd.hd_hash >= 91 and hd.hd_hash <= 841 and d.d_hash >= 374 and d.d_hash <= 774
;
