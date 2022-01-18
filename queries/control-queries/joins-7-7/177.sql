select count(ss.ss_item_sk)
from store_sales ss,customer c,date_dim d,customer_address a,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 527 and d.d_hash <= 860 and i.i_hash >= 564 and i.i_hash <= 964 and hd.hd_hash >= 117 and hd.hd_hash <= 867
;
