select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,customer c,customer_address a,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 66 and cd.cd_hash <= 816 and i.i_hash >= 457 and i.i_hash <= 857 and hd.hd_hash >= 401 and hd.hd_hash <= 734
;
