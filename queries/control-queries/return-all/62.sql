select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 243 and ss.ss_hash <= 993 and hd.hd_hash >= 509 and hd.hd_hash <= 842 and cd.cd_hash >= 494 and cd.cd_hash <= 894
;
