select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,item i,customer_demographics cd,customer_address a
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 611 and ss.ss_hash <= 944 and i.i_hash >= 171 and i.i_hash <= 921 and cd.cd_hash >= 538 and cd.cd_hash <= 938
;
