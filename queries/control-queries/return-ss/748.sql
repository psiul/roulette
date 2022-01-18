select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 457 and ss.ss_hash <= 790 and d.d_hash >= 232 and d.d_hash <= 632 and cd.cd_hash >= 194 and cd.cd_hash <= 944
;
