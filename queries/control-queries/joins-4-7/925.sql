select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 375 and hd.hd_hash <= 775 and i.i_hash >= 167 and i.i_hash <= 917 and cd.cd_hash >= 300 and cd.cd_hash <= 633
;
