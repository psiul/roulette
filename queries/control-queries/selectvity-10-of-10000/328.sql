select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 858 and ss.ss_hash <= 958 and d.d_hash >= 595 and d.d_hash <= 795 and cd.cd_hash >= 851 and cd.cd_hash <= 901
;
