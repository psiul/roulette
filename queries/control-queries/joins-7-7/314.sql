select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i,household_demographics hd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 181 and cd.cd_hash <= 931 and d.d_hash >= 511 and d.d_hash <= 911 and hd.hd_hash >= 545 and hd.hd_hash <= 878
;
