select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 788 and ss.ss_hash <= 988 and d.d_hash >= 744 and d.d_hash <= 844 and cd.cd_hash >= 502 and cd.cd_hash <= 552
;
