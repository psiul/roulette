select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 773 and ss.ss_hash <= 823 and hd.hd_hash >= 281 and hd.hd_hash <= 301 and i.i_hash >= 786 and i.i_hash <= 886
;
