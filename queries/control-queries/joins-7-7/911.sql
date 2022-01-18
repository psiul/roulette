select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,customer c,household_demographics hd,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 564 and cd.cd_hash <= 964 and d.d_hash >= 144 and d.d_hash <= 894 and hd.hd_hash >= 358 and hd.hd_hash <= 691
;
