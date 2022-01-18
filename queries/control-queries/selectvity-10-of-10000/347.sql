select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 518 and hd.hd_hash <= 718 and cd.cd_hash >= 353 and cd.cd_hash <= 403 and d.d_hash >= 590 and d.d_hash <= 690
;
