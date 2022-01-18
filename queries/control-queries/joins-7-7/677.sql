select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,customer c,date_dim d,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 636 and hd.hd_hash <= 969 and i.i_hash >= 235 and i.i_hash <= 985 and a.ca_hash >= 212 and a.ca_hash <= 612
;
