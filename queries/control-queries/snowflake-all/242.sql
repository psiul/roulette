select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 223 and hd.hd_hash <= 556 and i.i_hash >= 551 and i.i_hash <= 951 and cd.cd_hash >= 58 and cd.cd_hash <= 808
;
