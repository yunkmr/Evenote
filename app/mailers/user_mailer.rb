class UserMailer < ApplicationMailer

  # イベント前日のリマインドメール
  def event_day_remind

    @url = "https://0ee43e257cb54a8da0feebf0c61cb78f.vfs.cloud9.us-east-1.amazonaws.com/users/sign_in"

    before_1day_events = Event.all.select do |event|
      @event = event
      # (Time.current - 1.day < @event.date) && (@event.date < Time.current)
      (Date.tomorrow == @event.date)
    end

    before_1day_events_emails = before_1day_events .map do |before_1day_event|
      @admin = User.find(before_1day_event.user_id)
      # 通知
      @events = Event.where(id: before_1day_event.id)
      @events.each do |event|
        before_1day_event.create_notification_remind_event(@admin, event.user_id)
      end

      # 送信するメールアドレス
      participants = User.includes(:events).where(events: {id: before_1day_event.id })
      participant_mails = participants.pluck(:email)
    end

    emails = []
    before_1day_events_emails.each do |array_emails|
      array_emails.each do |array_email|
        emails << array_email
      end
    end
    mail(subject: "【リマインド】明日参加予定のイベンがあります", bcc: emails)

  end

  # チケット申し込み開始日前日のリマインドメール
  # def entry_start_day_remind
  def send_mail
    @url = "https://0ee43e257cb54a8da0feebf0c61cb78f.vfs.cloud9.us-east-1.amazonaws.com/users/sign_in"

    before_1day_entry_day = Ticket.all.select do |ticket|
      @ticket = ticket
      (Date.tomorrow == @ticket.entry_start_date)
    end

    before_1day_entry_day_emails = before_1day_entry_day .map do |before_1day_entry_start|
      @admin = User.find(before_1day_entry_start.user_id)
      # 通知
      @tickets = Ticket.where(id: before_1day_entry_start.id, entry_flg: FALSE)
      @tickets.each do |ticket|
        before_1day_entry_start.create_notification_remind_entry_start(@admin, ticket.user_id)
      end
      # 送信するメールアドレス
      participants = User.includes(:tickets).where(tickets: {id: before_1day_entry_start.id })
      participant_mails = participants.pluck(:email)
    end
    # before_1day_events_emailsは[["メールアドレス1", "メールアドレス2"], ["メールアドレス3", "メールアドレス4", "メールアドレス1"]]の状態
    emails = []
    before_1day_entry_day_emails.each do |array_emails|
      array_emails.each do |array_email|
        emails << array_email
      end
    end

    mail(subject: "【リマインド】明日チケットの申し込みを開始するイベントがあります", bcc: emails)

  end

  # チケット申し込み終了日前日のリマインドメール
  def entry_end_day_remind
    @url = "https://0ee43e257cb54a8da0feebf0c61cb78f.vfs.cloud9.us-east-1.amazonaws.com/users/sign_in"

    before_1day_entry_day = Ticket.all.select do |ticket|
      @ticket = ticket
      (Date.tomorrow == @ticket.entry_end_date)
    end

    before_1day_entry_day_emails = before_1day_entry_day .map do |before_1day_entry_end|
      @admin = User.find(before_1day_entry_end.user_id)
      # 通知
      @tickets = Ticket.where(id: before_1day_entry_end.id, entry_flg: FALSE)
      @tickets.each do |ticket|
        before_1day_entry_end.create_notification_remind_entry_end(@admin, ticket.user_id)
      end
      # 送信するメールアドレス
      participants = User.includes(:tickets).where(tickets: {id: before_1day_entry_end.id })
      participant_mails = participants.pluck(:email)
    end
    # before_1day_events_emailsは[["メールアドレス1", "メールアドレス2"], ["メールアドレス3", "メールアドレス4", "メールアドレス1"]]の状態
    emails = []
    before_1day_entry_day_emails.each do |array_emails|
      array_emails.each do |array_email|
        emails << array_email
      end
    end

    mail(subject: "【リマインド】明日チケットの申し込みを終了するイベントがあります", bcc: emails)

  end

  # チケット当選発表日前日のリマインドメール
  def win_day_remind
    @url = "https://0ee43e257cb54a8da0feebf0c61cb78f.vfs.cloud9.us-east-1.amazonaws.com/users/sign_in"

    before_1day_win_day = Ticket.all.select do |ticket|
      @ticket = ticket
      (Date.tomorrow == @ticket.win_date)
    end

    before_1day_win_day_emails = before_1day_win_day .map do |before_1day_win_day|
      @admin = User.find(before_1day_win_day.user_id)
      # 通知
      @tickets = Ticket.where(id: before_1day_win_day.id)
      @tickets = @tickets.where('win_flg IS NULL')

      @tickets.each do |ticket|
        before_1day_win_day.create_notification_remind_win(@admin, ticket.user_id)
      end
      # 送信するメールアドレス
      participants = User.includes(:tickets).where(tickets: {id: before_1day_win_day.id })
      participant_mails = participants.pluck(:email)
    end
    # before_1day_events_emailsは[["メールアドレス1", "メールアドレス2"], ["メールアドレス3", "メールアドレス4", "メールアドレス1"]]の状態
    emails = []
    before_1day_win_day_emails.each do |array_emails|
      array_emails.each do |array_email|
        emails << array_email
      end
    end

    mail(subject: "【リマインド】明日チケットの当選発表をするイベントがあります", bcc: emails)

  end

  # チケット支払期限日前日のリマインドメール
  def payment_day_remind
    @url = "https://0ee43e257cb54a8da0feebf0c61cb78f.vfs.cloud9.us-east-1.amazonaws.com/users/sign_in"

    before_1day_payment_day = Ticket.all.select do |ticket|
      @ticket = ticket
      (Date.tomorrow == @ticket.payment_date)
    end

    before_1day_payment_day_emails = before_1day_payment_day .map do |before_1day_payment_day|
      @admin = User.find(before_1day_payment_day.user_id)
      # 通知
      @tickets = Ticket.where(id: before_1day_payment_day.id, payment_flg: FALSE)

      @tickets.each do |ticket|
        before_1day_payment_day.create_notification_remind_payment(@admin, ticket.user_id)
      end
      # 送信するメールアドレス
      participants = User.includes(:tickets).where(tickets: {id: before_1day_payment_day.id })
      participant_mails = participants.pluck(:email)
    end
    # before_1day_events_emailsは[["メールアドレス1", "メールアドレス2"], ["メールアドレス3", "メールアドレス4", "メールアドレス1"]]の状態
    emails = []
    before_1day_payment_day_emails.each do |array_emails|
      array_emails.each do |array_email|
        emails << array_email
      end
    end

    mail(subject: "【リマインド】明日がチケットの支払期限のイベントがあります", bcc: emails)

  end

end
