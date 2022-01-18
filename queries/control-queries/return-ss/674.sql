select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 53 and ss.ss_hash <= 386 and d.d_hash >= 492 and d.d_hash <= 892 and cd.cd_hash >= 77 and cd.cd_hash <= 827
;
