select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 109 and i.i_hash <= 859 and hd.hd_hash >= 176 and hd.hd_hash <= 576 and cd.cd_hash >= 189 and cd.cd_hash <= 522
;
