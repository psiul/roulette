select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 255 and i.i_hash <= 655 and hd.hd_hash >= 18 and hd.hd_hash <= 351 and cd.cd_hash >= 82 and cd.cd_hash <= 832
;
