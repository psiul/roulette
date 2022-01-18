select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 148 and cd.cd_hash <= 248 and hd.hd_hash >= 330 and hd.hd_hash <= 380 and d.d_hash >= 530 and d.d_hash <= 730
;
